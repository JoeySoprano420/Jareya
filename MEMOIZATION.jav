import java.util.HashMap;
import java.util.Map;

public class Memoizer {
    private final Map<String, Object> cache = new HashMap<>();

    public Object memoize(String key, ExpensiveComputation computation) {
        if (!cache.containsKey(key)) {
            Object result = computation.perform();
            cache.put(key, result);
        }
        return cache.get(key);
    }

    interface ExpensiveComputation {
        Object perform();
    }
}

