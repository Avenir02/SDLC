module com.credit.lab2 {
  requires javafx.controls;
  requires javafx.fxml;

  opens com.credit.lab2 to javafx.fxml;
  exports com.credit.lab2;
}