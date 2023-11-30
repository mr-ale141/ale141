//
// Created by ale14 on 30.11.2023.
//
#include "gpio_user.h"

#define LOG_LOCAL_LEVEL ESP_LOG_VERBOSE
#include <esp_log.h>

#include <freertos/FreeRTOS.h>
#include <freertos/task.h>
#include <freertos/portmacro.h>

#include <driver/gpio.h>

static const char* TAG = "LED";

_Noreturn void gpio_user(void)
{
    gpio_config_t gpioConfig = {
            .mode = GPIO_MODE_OUTPUT,
            .pin_bit_mask = (1ULL<<2),
    };
    gpio_config(&gpioConfig);
    TickType_t xLastWakeTime = xTaskGetTickCount();
    int i = 0;
    while(1)
    {
        gpio_set_level(GPIO_NUM_2, 1);
        vTaskDelayUntil(&xLastWakeTime, 100);
        gpio_set_level(GPIO_NUM_2, 0);
        vTaskDelayUntil(&xLastWakeTime, 100);
        ESP_LOGE(TAG,"%d", i++);
    }
}