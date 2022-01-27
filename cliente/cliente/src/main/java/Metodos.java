import javafx.scene.control.TextArea;
import org.apache.hc.client5.http.classic.methods.HttpDelete;
import org.apache.hc.client5.http.classic.methods.HttpGet;
import org.apache.hc.client5.http.classic.methods.HttpPost;
import org.apache.hc.client5.http.classic.methods.HttpPut;
import org.apache.hc.client5.http.impl.classic.CloseableHttpClient;
import org.apache.hc.client5.http.impl.classic.CloseableHttpResponse;
import org.apache.hc.client5.http.impl.classic.HttpClients;
import org.apache.hc.core5.http.HttpEntity;
import org.apache.hc.core5.http.io.entity.EntityUtils;

import java.io.IOException;

public class Metodos {

    CloseableHttpClient httpClient = HttpClients.createDefault();

    public void get(TextArea text){

        HttpGet httpGet = new HttpGet("");

        CloseableHttpResponse response = null;

        try {
            response = httpClient.execute(httpGet);
            HttpEntity entity = response.getEntity();

            text.setText(entity.toString());

            EntityUtils.consume(entity);
            response.close();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }

    public void post(TextArea text){

        HttpPost httpPost = new HttpPost("");
        CloseableHttpResponse response = null;

        try {
            response = httpClient.execute(httpPost);

            HttpEntity entity = response.getEntity();

            text.setText(entity.toString());


            EntityUtils.consume(entity);
            response.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public void delete(TextArea text){

        HttpDelete httpDelete = new HttpDelete("");
        CloseableHttpResponse response = null;

        try {
            response = httpClient.execute(httpDelete);

            HttpEntity entity = response.getEntity();

            text.setText(entity.toString());


            EntityUtils.consume(entity);
            response.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public void update(TextArea text){

        HttpPut httpPut = new HttpPut("");
        CloseableHttpResponse response = null;

        try {
            response = httpClient.execute(httpPut);

            HttpEntity entity = response.getEntity();

            text.setText(entity.toString());


            EntityUtils.consume(entity);
            response.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

}