package TabletopMockups {
    part def Button { attribute label : String; }

    part masterWindow {
        part toolbar { part openMap : Button; part gridToggle : Button; part fogToggle : Button;
                       part undo : Button; part redo : Button; part save : Button; part openPlayers : Button; }
        part tokenPanel { part addToken : Button; }
        part fogTools { part brush; part rectangle; part closeAll : Button; part openAll : Button; }
        part canvasArea { attribute fogOpacity = 0.5; }
        part dicePanel { part dieButtons : Button[7]; part expression; part roll : Button; part journal; }
    }
    part playerWindow {
        part canvasArea { attribute fogOpacity = 1.0; attribute showTools = false; }
        part journal;
    }
    part messages { part errorToast; part warningToast; part successToast; }
}
