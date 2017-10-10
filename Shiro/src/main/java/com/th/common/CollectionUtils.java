package com.th.common;

import java.util.HashSet;
import java.util.List;
import java.util.Set;


public class CollectionUtils {

    public static <T> Set<T> listToSet(List<T> tList) {
        Set<T> tSet = new HashSet<T>();
        for (T t : tList) {
            tSet.add(t);
        }
        return tSet;
    }

}
