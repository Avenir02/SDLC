package TabletopArchitecture {
    package UI {
        part def MasterView;
        part def PlayerView;
        part def CanvasRenderer;
    }
    package Core {
        doc /* Ядро не использует DOM, Canvas и BroadcastChannel */
        part def SceneStore { part tokens : Token[0..*]; part fog : FogMask; part history : History; }
        part def Token;
        part def FogMask;
        part def DiceParser;
        part def History;
        part def SceneSerializer;
    }
    package Infrastructure {
        part def SyncChannel;
        part def FileIO;
        part def AutosaveStorage;
    }
    dependency from UI::MasterView to Core::SceneStore;
    dependency from UI::PlayerView to Core::SceneStore;
    dependency from UI::CanvasRenderer to Core::SceneStore;
    dependency from UI::MasterView to Core::DiceParser;
    dependency from Core::SceneStore to Infrastructure::SyncChannel;
    dependency from Core::SceneSerializer to Infrastructure::FileIO;
    dependency from Core::SceneStore to Infrastructure::AutosaveStorage;
}
