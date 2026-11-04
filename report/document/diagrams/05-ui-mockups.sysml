package SfxMockups {
    part def Button { attribute label : String; }
    part def Slider { attribute label : String; attribute min : Real; attribute max : Real; attribute value : Real; }

    part editorWindow {
        part presetBar { part presets : Button[8]; part random : Button; part mutate : Button; }
        part generatorPanel { part waveform; part duty : Slider; part frequency : Slider; part slide : Slider; }
        part envelopePanel { part attack : Slider; part decay : Slider; part sustain : Slider; part release : Slider; }
        part effectsPanel { part vibrato : Slider; part arpeggio : Slider; part lowPass : Slider; part highPass : Slider;
                            part bitcrush : Slider; part sampleRate : Slider; part volume : Slider; }
        part waveView;
        part actions { part play : Button; part exportWav : Button; part saveJson : Button; part loadJson : Button; }
        part history;
    }
    part exportDialog { attribute fileName : String; attribute sampleRate : Integer; }
    part messages { part successToast; part errorToast; part warningToast; }
}
