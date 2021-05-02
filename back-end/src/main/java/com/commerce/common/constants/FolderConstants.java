package com.commerce.common.constants;

import org.apache.tomcat.jni.Local;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class FolderConstants {
    private static String time = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")).replaceAll("-", "");
    public static final String AVATAR_FOLDER = "/avatar/" + time + "/";
    public static final String CATEGORY_FOLDER = "/categories/" + time + "/";
    public static final String PRODUCT_FOLDER = "/products/" + time + "/";
    public static final String DEFAULT_FOLDER = "/" + time + "/";

}
