package com.credit.planetwcalculator.model;

import java.util.Map;
import javafx.beans.property.DoubleProperty;
import javafx.beans.property.SimpleDoubleProperty;
import javafx.collections.FXCollections;
import javafx.collections.ObservableMap;

public class PlanetModel {

  private static final Map<String, Double> GRAVITY_COEFFICIENTS = Map.of(
      "Меркурий", 0.38,
      "Венера", 0.9,
      "Марс", 0.38,
      "Юпитер", 2.53,
      "Сатурн", 1.06,
      "Уран", 0.89,
      "Нептун", 1.14
  );
  private final DoubleProperty earthWeight = new SimpleDoubleProperty(0.0);

  private final ObservableMap<String, Double> planetWeights = FXCollections.observableHashMap();

  public PlanetModel() {
    GRAVITY_COEFFICIENTS.keySet().forEach(planet -> planetWeights.put(planet, 0.0));
    earthWeight.addListener((obs, oldVal, newVal) -> calculateWeight());
  }

  public void calculateWeight()
  {
    double currentWeight = earthWeight.get();
    GRAVITY_COEFFICIENTS.forEach((planet, coefficient) -> {
      planetWeights.put(planet, currentWeight * coefficient);
    });
  }

  public double getEarthWeight() { return earthWeight.get(); }
  public void setEarthWeight(double value) { this.earthWeight.set(value); }

  public ObservableMap<String, Double> getPlanetWeights() { return planetWeights; }
}


