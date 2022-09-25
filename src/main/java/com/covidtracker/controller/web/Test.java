package com.covidtracker.controller.web;

import com.google.gson.*;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.ObjectMapper;
import com.mashape.unirest.http.Unirest;
import org.apache.commons.io.FileUtils;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.xml.soap.Text;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

public class Test {
    public static void main(String[] args) {
//        try {
//            String content = new String(Files.readAllBytes(Paths.get("test.txt")));
//            Unirest.setTimeouts(0, 0);
//            HttpResponse<String> response = Unirest.post("https://wheelchair-detection.anscloudservices.com/v1/models/default:predict")
//                    .header("Content-Type", "application/json")
//                    .body("{\r\n            \"instances\": [\r\n                {\r\n                    \"image_bytes\": {\r\n                        \"b64\": \""+content+"\"\r\n                    }, \r\n                    \"key\": \"ans-wheelchair\"\r\n                }\r\n            ]\r\n}")
//                    .asString();
//
//            System.out.println(response);
//            //convert json object to pojo object
//            JSONObject obj = new JSONObject(response.getBody());
//            JSONArray pre_arr = obj.getJSONArray("predictions");
//            ArrayList<String> detection_scores = new ArrayList<>();
//            for (int i = 0; i < pre_arr.length(); i++)
//            {
//                String key = pre_arr.getJSONObject(i).getString("key");
//                JSONArray arr1 = pre_arr.getJSONObject(i).getJSONArray("detection_scores");
//                for(int j=0; j<arr1.length();j++){
//                    detection_scores.add(arr1.get(j).toString());
//                }
//            }
//            for (String x:detection_scores) {
//                System.out.print(x+" ");
//            }
////            JSONObject jsonObj = new JSONObject(response.getBody());
////            String jsonInString = new Gson().toJson(jsonObj);
////            System.out.println(jsonInString);
//        } catch (Exception e) {
//            System.out.println(e);
//            e.printStackTrace();
//        }
    }

    public void convert(){
        try {
            String content = new String(Files.readAllBytes(Paths.get("test.txt")));
            // create output file
            File outputFile = File.createTempFile("image","jpg");
            // decode the string and write to file
            byte[] decodedBytes = Base64
                    .getDecoder()
                    .decode(content);
            FileUtils.writeByteArrayToFile(outputFile, decodedBytes);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
