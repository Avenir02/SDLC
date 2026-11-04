package SfxUseCases {
    part def GameDeveloper;
    part def SoundDesigner;

    use case def ChoosePreset;
    use case def EditParameters;
    use case def RandomOrMutate;
    use case def PlaySound;
    use case def ExportWav;
    use case def SaveLoadParams;
    use case def UndoRedo;
    use case def ValidateParamsFile;
    use case def ShowError;

    use case def SfxSession {
        subject system : RetroSfxLab;
        actor dev : GameDeveloper;
        actor designer : SoundDesigner;
        include use case preset : ChoosePreset;
        include use case edit : EditParameters;
        include use case random : RandomOrMutate;
        include use case play : PlaySound;
        include use case export : ExportWav;
        include use case params : SaveLoadParams { include use case v : ValidateParamsFile; }
        include use case history : UndoRedo;
    }
}
