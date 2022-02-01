module com.example.cliente {
    requires javafx.controls;
    requires javafx.fxml;
    requires javafx.web;

    requires org.controlsfx.controls;
    requires com.dlsc.formsfx;
    requires validatorfx;
    requires org.kordamp.ikonli.javafx;
    requires org.kordamp.bootstrapfx.core;
    requires eu.hansolo.tilesfx;
    requires org.apache.httpcomponents.core5.httpcore5;
    requires org.apache.httpcomponents.client5.httpclient5;
    requires org.json;

    opens com.example.cliente to javafx.fxml;
    exports com.example.cliente;
}