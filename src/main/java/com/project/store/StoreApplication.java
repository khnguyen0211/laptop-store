package com.project.store;

import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class StoreApplication {

    public static int removeDuplicates(int[] nums) {
        //{0, 0, 0, 1, 1, 2, 2, 3, 3, 4}
        for (int i = 0; i < nums.length - 1; i++) {
            for (int j = i + 1; j < nums.length; j++) {
                if (nums[j] == nums[i]) {
                    nums[j] = -101;
                }
            }
        }
        int index = 0;
        for (int i = 0; i < nums.length; i++) {
            if (nums[i] != -101) {
                nums[index] = nums[i];
                index++;
            }
        }

        return index;
    }

    public static void main(String[] args) {
        int[] nums = {0, 0, 1, 1, 1, 2, 2, 3, 3, 4};
        removeDuplicates(nums);
        // SpringApplication.run(StoreApplication.class, args);
    }

}
