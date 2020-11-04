package com.mycompany.app;

/**
 * Basic App just for test purpose
 */
public class App
{
    private final String message = "Go!";

    public App() {}

    public static void main(String[] args) {
        System.out.println(new App().getMessage());
    }

    private final String getMessage() {
        return message;
    }

}