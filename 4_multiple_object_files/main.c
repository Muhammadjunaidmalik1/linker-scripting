/*
 * Copyright © 2024 inpyjama.com. All Rights Reserved.
 * Author: Piyush Itankar <piyush@inpyjama.com>
 */

int uninit_global;
int init_global = 18;

int foo(int local) {
   return local + uninit_global + init_global;
}