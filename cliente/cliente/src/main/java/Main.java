import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.TextArea;
import javafx.scene.layout.*;
import javafx.stage.Stage;

import javax.swing.*;
import java.awt.*;


public class Main extends Application{

    @Override
    public void start(Stage primaryStage) throws Exception {

        primaryStage.setTitle("Games Data");

        //crear botones y panel

        Metodos metodos = new Metodos();

        BorderPane borderPane = new BorderPane();

        Button bget = new Button("GET");
        bget.setMaxSize(150,50);
        Button bpost = new Button("POST");
        bpost.setMaxSize(150,50);
        Button bupdate = new Button("UPDATE");
        bupdate.setMaxSize(150,50);
        Button bdelete = new Button("DELETE");
        bdelete.setMaxSize(150,50);

        //funciones de botones

        bget.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent event) {
                metodos.get();
            }
        });
        bdelete.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent event) {
                metodos.delete();
            }
        });
        bpost.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent event) {
                metodos.update();
            }
        });


        //colocacion

        VBox vbox =  new VBox();
        vbox.setPadding(new Insets(5));
        vbox.setAlignment(Pos.CENTER);
        vbox.setMaxSize(Double.MAX_VALUE,Double.MAX_VALUE);

        vbox.getChildren().addAll(bget,bdelete,bupdate,bpost);

        borderPane.setLeft(vbox);

        TextArea text = new TextArea();

        text.setWrapText(true);

        borderPane.setCenter(text);

        Scene scene = new Scene(borderPane,700,600);
        primaryStage.setScene(scene);
        primaryStage.show();


    }
    public static void main(String[] args) {
        // write your code here

        launch(args);

    }

}
