package SfxStates {
    state def EditorFlow {
        entry; then ready;
        state ready;
        state rendering;
        state playing;
        state exporting;
        state failed;

        transition first ready accept ParamChanged then rendering;
        transition first rendering accept WaveUpdated then ready;
        transition first ready accept Play then playing;
        transition first playing accept Ended then ready;
        transition first playing accept Play then playing;
        transition first ready accept Export then exporting;
        transition first exporting accept Saved then ready;
        transition first exporting accept WriteError then failed;
        transition first ready accept LoadParams if invalid then failed;
        transition first failed accept Dismiss then ready;
    }
}
