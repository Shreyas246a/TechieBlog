/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 *
 * @author shrey
 */
public class FileHelper {
    
    public static boolean deletefile(String path){
        boolean f = false;
        
        try{
            File file = new File(path);
            file.delete();
            f=true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
public static boolean saveFile(InputStream is, String path) {
    boolean f = false;
    try (FileOutputStream fos = new FileOutputStream(path)) {
        byte[] buffer = new byte[1024];
        int bytesRead;
        while ((bytesRead = is.read(buffer)) != -1) {
            fos.write(buffer, 0, bytesRead);
        }
        fos.flush();
        f = true;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return f;
}
}
