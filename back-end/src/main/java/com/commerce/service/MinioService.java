package com.commerce.service;

import io.minio.errors.*;
import io.minio.messages.Bucket;

import java.io.IOException;
import java.io.InputStream;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

public interface MinioService {

    List<Bucket> getAllBuckets();

    void upload(String folder, String name, InputStream data);

    void delete(String url);

    byte[] getBytes(String key);
}
