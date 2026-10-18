package com.credit.planetwcalculator.controller;

import com.credit.planetwcalculator.model.PlanetModel;
import javafx.collections.MapChangeListener;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.control.TextArea;
import javafx.stage.Modality;
import javafx.stage.Stage;

import java.io.IOException;

// Контроллер главного окна
public class MainController {

  @FXML
  private Label currentWeightLabel;

  @FXML
  private TextArea resultArea;

  private final PlanetModel model = new PlanetModel();

  @FXML
  public void initialize() {
    model.getPlanetWeights().addListener((MapChangeListener<String, Double>) change -> updateResultsUI());
  }

  @FXML
  private void handleOpenInputDialog() {
    try {
      FXMLLoader loader = new FXMLLoader(getClass().getResource("/com/credit/planetwcalculator/dialog-view.fxml"));
      Stage dialogStage = new Stage();
      dialogStage.setTitle("Ввод веса");
      dialogStage.initModality(Modality.WINDOW_MODAL);
      dialogStage.setScene(new Scene(loader.load()));

      DialogController dialogController = loader.getController();
      // Передача текущего значения в диалоговое окно
      dialogController.setInitialWeight(model.getEarthWeight());

      dialogStage.showAndWait();

      // Обновление модели после закрытия диалога
      if (dialogController.isOkClicked()) {
        model.setEarthWeight(dialogController.getEnteredWeight());
      }

    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  private void updateResultsUI() {
    currentWeightLabel.setText("Ваш вес на Земле: " + model.getEarthWeight() + " кг");

    StringBuilder sb = new StringBuilder();
    model.getPlanetWeights().forEach((planet, weight) ->
        sb.append(planet).append(": ").append(String.format("%.2f", weight)).append(" кг\n")
    );
    resultArea.setText(sb.toString());
  }
}