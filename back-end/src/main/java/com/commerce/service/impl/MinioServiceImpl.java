package com.commerce.service.impl;

import com.commerce.service.MinioService;
import io.minio.GetObjectArgs;
import io.minio.MinioClient;
import io.minio.UploadObjectArgs;
import io.minio.errors.*;
import io.minio.messages.Bucket;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.apache.commons.
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

@Service
public class MinioServiceImpl implements MinioService {

    private MinioClient minioClient;

    @Value("${minio.bucket.name}")
    private String defaultBucket;

    @Override
    public List<Bucket> getAllBuckets() {
        try {
            return minioClient.listBuckets();
        } catch (ErrorResponseException | InsufficientDataException | InternalException | InvalidKeyException | InvalidResponseException | IOException | NoSuchAlgorithmException | ServerException | XmlParserException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public void upload(String folder, String name, InputStream data) throws IOException, ServerException, InsufficientDataException, ErrorResponseException, NoSuchAlgorithmException, InvalidKeyException, InvalidResponseException, XmlParserException, InternalException {
        Path tempFile = Files.createTempFile(name,"");
        Files.copy(data,tempFile, StandardCopyOption.REPLACE_EXISTING);
        UploadObjectArgs.Builder builder = UploadObjectArgs.builder().bucket(defaultBucket)
                .object(folder + name).filename(tempFile.toString());
        minioClient.uploadObject(builder.build());
    }

    @Override
    public byte[] getBytes(String key) {
        try {
            GetObjectArgs objectArgs = GetObjectArgs.builder().bucket(defaultBucket)
                    .object(key).build();
            InputStream obj = minioClient.getObject(objectArgs);
            byte[] content = IOUtils.toByteArray(obj);
            obj.close();
            return content;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
