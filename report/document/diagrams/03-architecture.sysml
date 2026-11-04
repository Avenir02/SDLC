package SfxArchitecture {
    package UI { part def ParamPanel; part def PresetBar; part def WaveView; }
    package Core {
        doc /* Ядро не использует DOM и Web Audio API */
        part def Params;
        part def Synth;
        part def Oscillator;
        part def Envelope;
        part def Effects;
        part def Presets;
        part def WavEncoder;
        part def ParamsSerializer;
        part def History;
    }
    package Infrastructure { part def WebAudioPlayer; part def FileIO; }
    dependency from UI::ParamPanel to Core::Params;
    dependency from UI::PresetBar to Core::Presets;
    dependency from UI::WaveView to Core::Synth;
    dependency from Core::Synth to Core::Oscillator;
    dependency from Core::Synth to Core::Envelope;
    dependency from Core::Synth to Core::Effects;
    dependency from Infrastructure::WebAudioPlayer to Core::Synth;
    dependency from Core::WavEncoder to Infrastructure::FileIO;
}
