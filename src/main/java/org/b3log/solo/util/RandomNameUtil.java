package org.b3log.solo.util;

import java.util.Random;

/**
 * 随机生成昵称Util
 */
public class RandomNameUtil {


    public static String generate() {
        RandomHan han = new RandomHan();
        return han.getRandomHan() + "" + han.getRandomHan() + han.getRandomHan();
    }

}

class RandomHan {
    private Random ran = new Random();
    private final static int delta = 0x9fa5 - 0x4e00 + 1;

    public char getRandomHan() {
        return (char) (0x4e00 + ran.nextInt(delta));
    }
}
