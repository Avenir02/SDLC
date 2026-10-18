package com.credit.planetwcalculator.controller;

import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

public class DialogController {

  @FXML
  private TextField weightField;

  private double enteredWeight = -1;
  private boolean okClicked = false;

  @FXML
  public void initialize() {
    weightField.setOnAction(event -> handleOk());
  }

  // Подстановка предыдущего значения при открытии
  public void setInitialWeight(double weight) {
    if (weight > 0) {
      weightField.setText(String.valueOf(weight));
    }
  }

  public boolean isOkClicked() {
    return okClicked;
  }

  public double getEnteredWeight() {
    return enteredWeight;
  }

  @FXML
  private void handleOk() {
    String input = weightField.getText();
    try {
      double parsed = Double.parseDouble(input);
      if (parsed <= 0) {
        showError("Вес должен быть положительным числом!");
        return;
      }
      this.enteredWeight = parsed;
      this.okClicked = true;
      closeStage();
    } catch (NumberFormatException e) {
      showError("Некорректный ввод! Введите число (например, 75.5).");
    }
  }

  @FXML
  private void handleCancel() {
    closeStage();
  }

  private void showError(String message) {
    Alert alert = new Alert(Alert.AlertType.ERROR);
    alert.setTitle("Ошибка ввода");
    alert.setHeaderText(null);
    alert.setContentText(message);
    alert.showAndWait();
  }

  private void closeStage() {
    Stage stage = (Stage) weightField.getScene().getWindow();
    stage.close();
  }
}