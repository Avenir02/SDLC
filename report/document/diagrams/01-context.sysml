package RetroSfxContext {
    doc /* Контекст системы Retro SFX Lab: веб-приложение, работающее в браузере */

    part def GameDeveloper;
    part def SoundDesigner;
    part def SoundDevice;
    part def UserFileSystem;
    part def GameEngine;

    part def RetroSfxLab {
        part editorUI    : EditorUI;
        part synthCore   : SynthCore;
        part audioPlayer : AudioPlayer;
        part wavEncoder  : WavEncoder;
    }

    part system : RetroSfxLab;
    part dev : GameDeveloper;
    part designer : SoundDesigner;
    part speaker : SoundDevice;
    part fs : UserFileSystem;
    part engine : GameEngine;

    connection useDev connect dev to system.editorUI;
    connection useDesigner connect designer to system.editorUI;
    connection params connect system.editorUI to system.synthCore;
    connection samplesPlay connect system.synthCore to system.audioPlayer;
    connection samplesWav connect system.synthCore to system.wavEncoder;
    connection sound connect system.audioPlayer to speaker;
    connection saveWav connect system.wavEncoder to fs;
    connection importWav connect fs to engine;
}
