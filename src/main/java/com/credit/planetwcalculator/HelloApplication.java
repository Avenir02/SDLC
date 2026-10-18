package com.credit.planetwcalculator;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.stage.Stage;

import java.io.IOException;

// Главный класс приложения JavaFX
public class HelloApplication extends Application {

  @Override
  public void start(Stage stage) throws IOException {
    FXMLLoader fxmlLoader = new FXMLLoader(HelloApplication.class.getResource("/com/credit/planetwcalculator/main-view.fxml"));

    if (fxmlLoader.getLocation() == null) {
      throw new RuntimeException("Не удалось найти main-view.fxml! Проверьте путь в resources.");
    }

    Scene scene = new Scene(fxmlLoader.load(), 380, 360);
    stage.setTitle("Калькулятор веса на планетах");
    stage.setScene(scene);
    stage.show();
  }

  public static void main(String[] args) {
    launch();
  }
}