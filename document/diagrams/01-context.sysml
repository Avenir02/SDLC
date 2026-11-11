package TabletopContext {
    doc /* Контекст системы Tabletop Canvas: веб-приложение, работающее в браузере */

    part def GameMaster;          // управляет приложением
    part def Players;             // смотрят на окно игроков
    part def SharedScreen;        // общий экран или проектор
    part def UserFileSystem;      // карты и файлы сцен
    part def LocalStorage;        // автосохранение сцены

    part def TabletopCanvas {
        part masterWindow : MasterWindow;
        part playerWindow : PlayerWindow;
        part sceneCore    : SceneCore;
    }

    interface def BroadcastSync {
        doc /* BroadcastChannel, задержка не более 200 мс */
    }

    part system : TabletopCanvas;
    part gm : GameMaster;
    part players : Players;
    part screen : SharedScreen;
    part fs : UserFileSystem;
    part storage : LocalStorage;

    connection manage connect gm to system.masterWindow;
    connection sync : BroadcastSync connect system.sceneCore to system.playerWindow;
    connection display connect system.playerWindow to screen;
    connection watch connect screen to players;
    connection files connect system.masterWindow to fs;
    connection autosave connect system.sceneCore to storage;
}
