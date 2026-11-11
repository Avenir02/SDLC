package TabletopUseCases {
    part def GameMaster;
    part def Player;

    use case def LoadMap;
    use case def ConfigureGrid;
    use case def PlaceAndMoveToken;
    use case def ManageFog;
    use case def RollDice;
    use case def SaveOpenScene;
    use case def OpenPlayersWindow;
    use case def UndoRedo;
    use case def ValidateFile;
    use case def ShowError;

    use case def TabletopSession {
        subject system : TabletopCanvas;
        actor gm : GameMaster;
        actor player : Player;
        include use case load : LoadMap { include use case v1 : ValidateFile; }
        include use case grid : ConfigureGrid;
        include use case token : PlaceAndMoveToken;
        include use case fog : ManageFog;
        include use case dice : RollDice;
        include use case scene : SaveOpenScene { include use case v2 : ValidateFile; }
        include use case players : OpenPlayersWindow;
        include use case undo : UndoRedo;
    }
}
