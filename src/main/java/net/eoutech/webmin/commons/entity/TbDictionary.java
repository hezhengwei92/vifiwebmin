package net.eoutech.webmin.commons.entity;

/**
 * Created by wei on 2017/10/20.
 */
public class TbDictionary {
    private Integer KeyId;
    private String keyMap;
    private String valueMap;

    public String getKeyMap() {
        return keyMap;
    }

    public void setKeyMap(String keyMap) {
        this.keyMap = keyMap;
    }

    public Integer getKeyId() {
        return KeyId;
    }

    public void setKeyId(Integer keyId) {
        KeyId = keyId;
    }

    public String getValueMap() {
        return valueMap;
    }

    public void setValueMap(String valueMap) {
        this.valueMap = valueMap;
    }
}
