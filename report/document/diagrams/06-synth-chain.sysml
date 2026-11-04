package SfxSynthChain {
    part synthChain {
        part rng : Rng;
        part freqMod : FrequencyModulation;   // slide, vibrato, arpeggio
        part osc : Oscillator;                // square, saw, triangle, sine, noise
        part env : Envelope;                  // ADSR
        part filter : Filter;                 // low-pass / high-pass
        part crush : Bitcrush;
        part gain : GainLimiter;              // 0 dBFS
        part samples : SampleBuffer;
        part wav : WavEncoder;
        part player : AudioBuffer;

        flow from freqMod to osc;
        flow from osc to env;
        flow from env to filter;
        flow from filter to crush;
        flow from crush to gain;
        flow from gain to samples;
        flow from samples to wav;
        flow from samples to player;
        flow from rng to osc;
    }
}
