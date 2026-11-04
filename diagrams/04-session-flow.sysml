package TabletopStates {
    state def SessionFlow {
        entry; then empty;
        state empty;
        state editing;
        state presenting;
        state saving;
        state confirmClose;

        transition first empty accept LoadMap if mapIsValid then editing;
        transition first empty accept LoadMap if mapIsInvalid do showError then empty;
        transition first editing accept OpenPlayers then presenting;
        transition first presenting accept ClosePlayers then editing;
        transition first editing accept Save then saving;
        transition first saving accept Done then editing;
        transition first editing accept Close if hasUnsavedChanges then confirmClose;
        transition first confirmClose accept Cancel then editing;
        transition first confirmClose accept Confirm then done;
        transition first editing accept Close if noChanges then done;
    }
}
