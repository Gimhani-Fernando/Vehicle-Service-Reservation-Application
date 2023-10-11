package config;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class Config {
    private static final Properties properties = new Properties();

    static {
        try (InputStream input = Config.class.getClassLoader().getResourceAsStream("application.properties")) {
            properties.load(input);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //Database configs
    public static String getDatabaseURL() {
        return properties.getProperty("db.url");
    }

    public static String getDatabaseUsername() {
        return properties.getProperty("db.username");
    }

    public static String getDatabasePassword() {
        return properties.getProperty("db.password");
    }
    
    //Asgardeo configs
    public static String getClientId() {
        return properties.getProperty("client.id");
    }

    public static String getClientSecret() {
        return properties.getProperty("client.secret");
    }

    public static String getRedirectUri() {
        return properties.getProperty("redirect.uri");
    }

    public static String getTokenEndpoint() {
        return properties.getProperty("token.endpoint");
    }
}
