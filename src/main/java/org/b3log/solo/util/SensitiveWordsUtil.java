package org.b3log.solo.util;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.LineIterator;
import org.apache.commons.lang.StringUtils;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * 敏感字词处理类
 * <p>
 * Created by panjiannan on 2017/8/5.
 */
public class SensitiveWordsUtil {
    private final static File wordfilter = new File("src/main/resources/wordfilter.txt");

    private static long lastModified = 0L;
    private static List<String> words = new ArrayList<String>();

    private static void checkReload() {
        if (wordfilter.lastModified() > lastModified) {
            synchronized (SensitiveWordsUtil.class) {
                try {
                    lastModified = wordfilter.lastModified();
                    LineIterator lines = FileUtils.lineIterator(wordfilter, "utf-8");
                    while (lines.hasNext()) {
                        String line = lines.nextLine();
                        if (StringUtils.isNotBlank(line))
                            words.add(StringUtils.trim(line).toLowerCase());
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * 检查敏感字内容
     *
     * @param contents
     */
    public static String check(String... contents) {
        if (!wordfilter.exists())
            return null;
        checkReload();
        for (String word : words) {
            for (String content : contents)
                if (content != null && content.indexOf(word) >= 0)
                    return word;
        }
        return null;
    }

    /**
     * 检查字符串是否包含敏感词
     *
     * @param content
     * @return
     */
    public static boolean isContain(String content) {
        if (!wordfilter.exists())
            return false;
        checkReload();
        for (String word : words) {
            if (content != null && content.indexOf(word) >= 0)
                return true;
        }
        return false;
    }

    /**
     * 替换掉字符串中的敏感词
     *
     * @param str         等待替换的字符串
     * @param replaceChar 替换字符
     * @return
     */
    public static String replace(String str, String replaceChar) {
        checkReload();
        for (String word : words) {
            if (str.indexOf(word) >= 0) {
                String reChar = "";
                for (int i = 0; i < word.length(); i++) {
                    reChar += replaceChar;
                }
                str = str.replaceAll(word, reChar);
            }
        }
        return str;
    }

    public static List<String> lists() {
        checkReload();
        return words;
    }

    /**
     * 添加敏感词
     *
     * @param word
     * @throws IOException
     */
    public static void add(String word) throws IOException {
        word = word.toLowerCase();
        if (!words.contains(word)) {
            words.add(word);
            FileUtils.writeLines(wordfilter, "UTF-8", words);
            lastModified = wordfilter.lastModified();
        }
    }

    /**
     * 删除敏感词
     *
     * @param word
     * @throws IOException
     */
    public static void delete(String word) throws IOException {
        word = word.toLowerCase();
        words.remove(word);
        FileUtils.writeLines(wordfilter, "UTF-8", words);
        lastModified = wordfilter.lastModified();
    }

    public static void main(String[] args) throws Exception {
        System.out.println(SensitiveWordsUtil.replace("中国共产党钓鱼岛", "*"));
        System.out.println(SensitiveWordsUtil.isContain("岛"));
        SensitiveWordsUtil.add("傻逼");
    }

}
