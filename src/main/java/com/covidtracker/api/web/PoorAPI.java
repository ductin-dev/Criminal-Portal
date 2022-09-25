package com.covidtracker.api.web;

import com.covidtracker.controller.admin.PoorController;
import com.covidtracker.service.IWheelChairService;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.Unirest;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;

@RestController(value = "poorAPI")
public class PoorAPI {

    @Autowired
    IWheelChairService wheelChairService;

    @PostMapping(value = "/support-register")
    public ModelAndView upload(@RequestParam(value = "imgBase64", defaultValue = "") String imgBase64,
                               @RequestParam(value = "name", defaultValue = "") String name,
                               @RequestParam(value = "phone", defaultValue = "") String phone,
                               @RequestParam(value = "address", defaultValue = "") String address,
                               @RequestParam(value = "detail", defaultValue = "") String detail, HttpServletRequest request) throws UnsupportedEncodingException {
        //WheelChairDTO dto = new WheelChairDTO();
        request.setCharacterEncoding("UTF-8");
        PoorController.wheelChairDTO.setName(name);
        PoorController.wheelChairDTO.setPhone(phone);
        PoorController.wheelChairDTO.setAddress(address);
        PoorController.wheelChairDTO.setDetail(detail);
        ModelAndView mav = new ModelAndView("support-register");
        if (imgBase64.isEmpty()) {
            System.out.println("Image empty");
        } else {
            String encodedfile = imgBase64;
            System.out.println(encodedfile);
            PoorController.wheelChairDTO.setBase64(encodedfile);
            int check = isConfirm(encodedfile);
            if (check == 1) {
                mav.addObject("swal_success", "<script>\n" +
                        "    swal(\n" +
                        "        'Sign Up Success!',\n" +
                        "        'You have been placed in priority. We will contact you later.',\n" +
                        "        'success'\n" +
                        "    ).then((result) => {\n" +
                        "        window.location.href = \"/trang-chu\";\n" +
                        "    });\n" +
                        "</script>");
                PoorController.wheelChairDTO.setStatus(1);
                System.out.println("You are NGHEO");
            } else if(check == 0){
                mav.addObject("swal_success", "<script>\n" +
                        "    swal(\n" +
                        "        'Sign Up Success!',\n" +
                        "        'We will contact you later.',\n" +
                        "        'success'\n" +
                        "    ).then((result) => {\n" +
                        "        window.location.href = \"/trang-chu\";\n" +
                        "    });\n" +
                        "</script>");
                PoorController.wheelChairDTO.setStatus(-1);
                System.out.println("You are RICH");
            } else {
                mav.addObject("swal_success", "<script>\n" +
                        "    swal(\n" +
                        "        'Image existed!',\n" +
                        "        'Please upload your own image.',\n" +
                        "        'warning'\n" +
                        "    )\n "+
                        "</script>");
                System.out.println("DUPLICATED");
                return mav;
            }
        }
        wheelChairService.save(PoorController.wheelChairDTO);
        return mav;
    }

    public int isConfirm(String content){
        try {
            String allImg = new String(Files.readAllBytes(Paths.get("test.txt")));
            String imgArr [] = allImg.split("@@@");
            System.out.println("Size: "+imgArr.length);
            for (String i:imgArr) {
                if(content.contains(i) || i.contains(content)){
                    return -1;
                }
            }
            BufferedWriter writer = new BufferedWriter(new FileWriter("test.txt", true));
            writer.append("\n@@@");
            writer.append(content);
            writer.close();
            String apiUrl = "https://wheelchair-classification.anscloudservices.com/v1/models/default:predict";
            Unirest.setTimeouts(0, 0);
            HttpResponse<String> response = Unirest.post(apiUrl)
                    .header("Content-Type", "application/json")
                    .body("{\r\n            \"instances\": [\r\n                {\r\n                    \"image_bytes\": {\r\n                        \"b64\": \""+content+"\"\r\n                    }, \r\n                    \"key\": \"ans-wheelchair\"\r\n                }\r\n            ]\r\n}")
                    .asString();
            //convert json object to pojo object
            JSONObject obj = new JSONObject(response.getBody());
            JSONArray pre_arr = obj.getJSONArray("predictions");
            ArrayList<String> detection_scores = new ArrayList<>();
            for (int i = 0; i < pre_arr.length(); i++)
            {
                String key = pre_arr.getJSONObject(i).getString("key");
                JSONArray arr1 = pre_arr.getJSONObject(i).getJSONArray("scores");
                for(int j=0; j<arr1.length();j++){
                    detection_scores.add(arr1.get(j).toString());
                }
            }
            for (String x:detection_scores) {
                System.out.print(x+" ");
            }
            System.out.println();
            if(Float.parseFloat(detection_scores.get(1))>0.8){
                return 1;
            }
            //print all json data
//            JSONObject jsonObj = new JSONObject(response.getBody());
//            String jsonInString = new Gson().toJson(jsonObj);
//            System.out.println(jsonInString);
        } catch (Exception e) {
            System.out.println(e);
            e.printStackTrace();
        }
        return 0;
    }

//    @GetMapping("/upload-test")
//    public ModelAndView uploadTest() {
//        ModelAndView mav = new ModelAndView("uploadTest");
//        return mav;
//    }
//
//
//    @PostMapping("/upload-test")
//    public ModelAndView uploadTest(@RequestParam(value = "imgBase64", defaultValue = "") String imgBase64) {
//        ModelAndView mav = new ModelAndView("uploadTest");
//        if (imgBase64.isEmpty()) {
//            mav.addObject("message", "Please upload an image!");
//        } else {
//            String encodedfile = imgBase64;
//            System.out.println(encodedfile);
//            mav.addObject("base64Image", encodedfile);
//            int check = isConfirmTest(encodedfile);
//            if (check == 1) {
//                System.out.println("You are NGHEO");
//                mav.addObject("message", "You are NGHEO");
//            } else if (check == 0) {
//                System.out.println("You are RICH");
//                mav.addObject("message", "You are GIAU");
//            } else {
//                System.out.println("DUPPLICATED");
//                mav.addObject("message", "DUPPLICATED");
//            }
//
//            mav.addObject("base64Image", encodedfile);
//        }
//        return mav;
//    }

}
