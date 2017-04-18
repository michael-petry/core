package com.dotcms.cluster.business;

import com.dotmarketing.util.Logger;
import com.dotmarketing.util.WebKeys;
import com.hazelcast.config.XmlConfigBuilder;
import com.hazelcast.core.Hazelcast;
import com.hazelcast.core.HazelcastInstance;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.net.URISyntaxException;
import java.net.URL;

/**
 * Created by jasontesser on 4/5/17.
 */
public class HazelcastUtil {

    private static HazelcastInstance _memberInstance;
    final String syncMe = "hazelSync";
    private String xmlFilePath = null;

    public HazelcastInstance getHazel(String xmlPath){
        this.xmlFilePath=xmlPath;
        return getHazel();
    }

    public HazelcastInstance getHazel() {
        try{
            initMember();
        }catch (Exception e) {
            Logger.error(HazelcastUtil.class, "Could not initialize Hazelcast Member", e);
        }
        return _memberInstance;
    }

    public void shutdown(){
        if (_memberInstance == null) {
            synchronized (syncMe) {
                if ( _memberInstance == null) {
                    _memberInstance.shutdown();
                    _memberInstance = null;
                }
            }
        }
    }

    private void initMember () {

        if (_memberInstance == null) {
            long start = System.currentTimeMillis();
            synchronized (syncMe) {
                if ( _memberInstance == null) {
                    if(xmlFilePath == null){
                        xmlFilePath = "hazelcast-embedded.xml";
                    }
                    Logger.info(this, "Setting Up HazelCast");
                    InputStream is = null;
                    try {
                        Logger.info(this, "Using hazel resource " + xmlFilePath);
                        is = getClass().getClassLoader().getResourceAsStream(xmlFilePath);
                        URL url = getClass().getResource(xmlFilePath);
                        try {
                            Logger.info(this, "hazelFile path " + new FileInputStream(url.toURI().getPath()));
                        } catch (FileNotFoundException e) {
                            e.printStackTrace();
                        } catch (URISyntaxException e) {
                            e.printStackTrace();
                        }
                        Logger.info(this, "Initializing hazel builder ");
                        XmlConfigBuilder builder = new XmlConfigBuilder(is);
                        Logger.info(this, "hazel builder initialized" + builder.getNamespaceType());
                        _memberInstance = Hazelcast.newHazelcastInstance(builder.build());
                        Logger.info(this, "Hazel member instance initialized " + _memberInstance.getName());
                    } finally {
                        if (is != null) {
                            try {
                                is.close();
                            }catch (Exception e){
                                Logger.error(Hazelcast.class, "Unable to close inputstream for Hazel xml", e);
                            }
                        }
                    }
                }
            }
            System.setProperty(WebKeys.DOTCMS_STARTUP_TIME_HAZEL, String.valueOf(System.currentTimeMillis() - start));
        }
    }
}
