package TabletopSceneFile {
    attribute def SceneFile {
        attribute schemaVersion : Integer;
        attribute savedAt : String;
        part map : MapInfo;
        part grid : GridInfo;
        part tokens : TokenRec[0..*];
        part fog : FogState;
    }
    attribute def MapInfo { attribute name : String; attribute width : Integer; attribute height : Integer; attribute image : String; }
    attribute def GridInfo { attribute enabled : Boolean; attribute cellSize : Integer; attribute offsetX : Integer; attribute offsetY : Integer; }
    attribute def TokenRec { attribute id : String; attribute name : String; attribute color : String;
                             attribute size : Integer; attribute col : Integer; attribute row : Integer; attribute hidden : Boolean; }
    attribute def FogState { attribute enabled : Boolean; attribute openedCells : Integer[0..*]; }
}
