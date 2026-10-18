module com.credit.planetwcalculator {
  requires javafx.controls;
  requires javafx.fxml;

  // Разрешаем JavaFX открывать главное приложение
  exports com.credit.planetwcalculator;
  opens com.credit.planetwcalculator to javafx.fxml;

  // КРИТИЧНО: Разрешаем JavaFX читать аннотации @FXML внутри пакета controller
  exports com.credit.planetwcalculator.controller;
  opens com.credit.planetwcalculator.controller to javafx.fxml;
}
