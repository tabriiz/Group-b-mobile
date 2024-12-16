/*
  Rui Santos
  Complete project details at https://RandomNerdTutorials.com/esp32-load-cell-hx711/
  
  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files.
*/

// Kalibrasi load cell
#include <Arduino.h>
#include "soc/rtc.h"
#include "HX711.h"

// Konfigurasi pin HX711
const int LOADCELL_DOUT_PIN = 16;
const int LOADCELL_SCK_PIN = 4;

HX711 scale;

void setup() {
  Serial.begin(115200);

  // Konfigurasi frekuensi CPU untuk kestabilan
  rtc_cpu_freq_config_t config;
  rtc_clk_cpu_freq_get_config(&config);
  rtc_clk_cpu_freq_to_config(RTC_CPU_FREQ_80M, &config);
  rtc_clk_cpu_freq_set_config_fast(&config);

  // Inisialisasi HX711
  scale.begin(LOADCELL_DOUT_PIN, LOADCELL_SCK_PIN);
  Serial.println("Kalibrasi HX711 dimulai...");
  
  // Proses Tare
  Serial.println("Tare... harap kosongkan load cell.");
  delay(5000);
  scale.tare();
  Serial.println("Tare selesai.");

  // Minta pengguna untuk menempatkan berat yang diketahui
  Serial.println("Tempatkan beban yang diketahui pada load cell untuk kalibrasi.");
  delay(5000);
}

void loop() {
  if (scale.is_ready()) {
    // Set scale ke default (1) untuk kalibrasi manual
    scale.set_scale(1.0);
    
    // Mengambil rata-rata 10 pembacaan untuk hasil yang stabil
    long reading = scale.get_units(10);
    Serial.print("Hasil Pembacaan (tanpa kalibrasi): ");
    Serial.println(reading);
    
    Serial.println("Masukkan berat yang diketahui (dalam gram): ");
    // Tunggu input dari serial monitor untuk memasukkan berat yang diketahui
    
    while (!Serial.available()) {}  // Menunggu input
    float known_weight = Serial.parseFloat();  // Berat yang diketahui dalam gram
    Serial.print("Berat diketahui: ");
    Serial.println(known_weight);

    // Hitung faktor kalibrasi
    float calibration_factor = reading / known_weight;
    Serial.print("Faktor Kalibrasi: ");
    Serial.println(calibration_factor);

    // Simpan nilai calibration_factor ini untuk digunakan di pengukuranberat.cpp
  } 
  else {
    Serial.println("HX711 tidak terhubung.");
  }
  delay(2000);  // Delay agar pembacaan tidak terlalu cepat
}
