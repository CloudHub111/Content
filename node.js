const fs = require('fs');

const Alphabet = " abcdefghijklmnopqrstuvwxyz!,.?";
const VocabSize = Alphabet.length;
const SaveFile = 'brain_v2.json';

const CreateMatrix = (Rows, Cols) => 
    Array.from({ length: Rows }, () => 
        Array.from({ length: Cols }, () => (Math.random() * 0.1 - 0.05))
    );

const DotProduct = (A, B) => {
    let Sum = 0;
    for (let i = 0; i < A.length; i++) Sum += A[i] * (B[i] || 0);
    return Sum;
};

const SafeSoftmax = (Arr) => {
    let Max = Math.max(...Arr);
    let Exps = Arr.map(x => Math.exp(Math.min(x - Max, 0)));
    let Sum = Exps.reduce((a, b) => a + b, 0);
    return Exps.map(x => Sum === 0 ? 0 : x / Sum);
};

class AttentionLayer {
    constructor(Size) {
        this.Size = Size;
        this.Wq = CreateMatrix(Size, Size);
        this.Wk = CreateMatrix(Size, Size);
        this.Wv = CreateMatrix(Size, Size);
    }

    Forward(Vecs) {
        let Len = Vecs.length;
        if (Len === 0) return [];
        let Q = Vecs.map(v => this.Wq.map(row => DotProduct(v, row)));
        let K = Vecs.map(v => this.Wk.map(row => DotProduct(v, row)));
        let V = Vecs.map(v => this.Wv.map(row => DotProduct(v, row)));
        let Out = Array.from({ length: Len }, () => new Array(this.Size).fill(0));
        for (let i = 0; i < Len; i++) {
            let Scores = K.map(kV => DotProduct(Q[i], kV) / Math.sqrt(this.Size));
            let Att = SafeSoftmax(Scores);
            for (let j = 0; j < Len; j++) {
                for (let d = 0; d < this.Size; d++) Out[i][d] += Att[j] * V[j][d];
            }
        }
        return Out;
    }
}

class DoubleLayerGPT {
    constructor(VSize, ESize) {
        this.VSize = VSize;
        this.ESize = ESize;
        this.TokenEmbed = CreateMatrix(VSize, ESize);
        this.Layer1 = new AttentionLayer(ESize);
        this.Layer2 = new AttentionLayer(ESize);
        this.OutputLayer = CreateMatrix(VSize, ESize);
        this.LR = 0.01;
    }

    Forward(IDs) {
        let Vecs = IDs.map(id => this.TokenEmbed[id] || new Array(this.ESize).fill(0));
        let L1 = this.Layer1.Forward(Vecs);
        let L2 = this.Layer2.Forward(L1);
        return L2.map(v => SafeSoftmax(this.OutputLayer.map(row => DotProduct(v, row))));
    }

    Train(IDs, TargetIdx) {
        let Probs = this.Forward(IDs);
        let Prediction = Probs[Probs.length - 1];
        for (let i = 0; i < this.VSize; i++) {
            let Error = Prediction[i] - (i === TargetIdx ? 1 : 0);
            for (let d = 0; d < this.ESize; d++) {
                this.OutputLayer[i][d] -= Error * this.LR;
                this.OutputLayer[i][d] *= 0.999;
                if (this.OutputLayer[i][d] > 1) this.OutputLayer[i][d] = 1;
                if (this.OutputLayer[i][d] < -1) this.OutputLayer[i][d] = -1;
            }
        }
    }

    Save(Path) {
        fs.writeFileSync(Path, JSON.stringify({
            TE: this.TokenEmbed, OL: this.OutputLayer,
            L1: { q: this.Layer1.Wq, k: this.Layer1.Wk, v: this.Layer1.Wv },
            L2: { q: this.Layer2.Wq, k: this.Layer2.Wk, v: this.Layer2.Wv }
        }));
    }

    Load(Path) {
        if (!fs.existsSync(Path)) return;
        let D = JSON.parse(fs.readFileSync(Path));
        this.TokenEmbed = D.TE; this.OutputLayer = D.OL;
        this.Layer1.Wq = D.L1.q; this.Layer1.Wk = D.L1.k; this.Layer1.Wv = D.L1.v;
        this.Layer2.Wq = D.L2.q; this.Layer2.Wk = D.L2.k; this.Layer2.Wv = D.L2.v;
    }
}

const Brain = new DoubleLayerGPT(VocabSize, 64);
const Encode = (s) => s.toLowerCase().split("").map(c => Math.max(0, Alphabet.indexOf(c)));

const AutoChat = (Seed, Len, Temp = 0.7) => {
    let Res = Seed;
    for (let i = 0; i < Len; i++) {
        let Out = Brain.Forward(Encode(Res.slice(-10)));
        let Probs = Out[Out.length - 1];
        let Logits = Probs.map(p => Math.pow(p, 1 / Temp));
        let Sum = Logits.reduce((a, b) => a + b, 0);
        let Norm = Logits.map(l => l / Sum);
        let Rand = Math.random(), Cum = 0, Best = 0;
        for (let j = 0; j < Norm.length; j++) {
            Cum += Norm[j];
            if (Rand < Cum) { Best = j; break; }
        }
        Res += Alphabet[Best];
    }
    return Res;
};

const TrainingFile = 'dataset.txt';
if (fs.existsSync(TrainingFile)) {
    let Text = fs.readFileSync(TrainingFile, 'utf8').toLowerCase();
    for (let step = 0; step < 100000; step++) {
        let Start = Math.floor(Math.random() * (Text.length - 11));
        let Chunk = Text.substring(Start, Start + 10);
        let Next = Alphabet.indexOf(Text[Start + 10]);
        if (Next !== -1) Brain.Train(Encode(Chunk), Next);
        if (step % 10000 === 0) {
            console.log(`Step ${step}: ${AutoChat("get out", 5)}`);
        }
    }
    Brain.Save(SaveFile);
}

console.log(AutoChat("get out",10))
