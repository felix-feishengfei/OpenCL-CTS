//
// Copyright (c) 2017 The Khronos Group Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
#include "harness/errorHelpers.h"
#include "harness/kernelHelpers.h"
#include "harness/typeWrappers.h"
#include "harness/clImageHelper.h"
#include "harness/imageHelpers.h"

extern int test_semaphores_simple_1(cl_device_id deviceID, cl_context context,
                                    cl_command_queue queue, int num_elements);
extern int test_semaphores_simple_2(cl_device_id deviceID, cl_context context,
                                    cl_command_queue queue, int num_elements);
extern int test_semaphores_reuse(cl_device_id deviceID, cl_context context,
                                 cl_command_queue queue, int num_elements);
extern int test_semaphores_cross_queues_ooo(cl_device_id deviceID,
                                            cl_context context,
                                            cl_command_queue queue,
                                            int num_elements);
extern int test_semaphores_cross_queues_io(cl_device_id deviceID,
                                           cl_context context,
                                           cl_command_queue queue,
                                           int num_elements);
extern int test_semaphores_multi_signal(cl_device_id deviceID,
                                        cl_context context,
                                        cl_command_queue queue,
                                        int num_elements);
extern int test_semaphores_multi_wait(cl_device_id deviceID, cl_context context,
                                      cl_command_queue queue, int num_elements);
extern int test_semaphores_queries(cl_device_id deviceID, cl_context context,
                                   cl_command_queue queue, int num_elements);
extern int test_semaphores_order_1(cl_device_id deviceID, cl_context context,
                                   cl_command_queue queue, int num_elements);
extern int test_semaphores_order_2(cl_device_id deviceID, cl_context context,
                                   cl_command_queue queue, int num_elements);
extern int test_semaphores_order_3(cl_device_id deviceID, cl_context context,
                                   cl_command_queue queue, int num_elements);
extern int test_semaphores_import_export_fd(cl_device_id deviceID,
                                            cl_context context,
                                            cl_command_queue queue,
                                            int num_elements);
extern int test_semaphores_invalid_command(cl_device_id deviceID,
                                           cl_context context,
                                           cl_command_queue queue,
                                           int num_elements);
