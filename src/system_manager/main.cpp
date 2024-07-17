/*
 * Copyright (C) 2019  SCS Lab <scs-help@cs.iit.edu>, Hariharan
 * Devarajan <hdevarajan@hawk.iit.edu>, Anthony Kougkas
 * <akougkas@iit.edu>, Xian-He Sun <sun@iit.edu>
 *
 * This file is part of Labios
 *
 * Labios is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU General Public
 * License along with this program.  If not, see
 * <http://www.gnu.org/licenses/>.
 */
#include "system_manager_service.h"
#include <labios/common/enumerations.h>
#include <signal.h>
#include <iostream>


int main() {

    // Assuming SOME_SERVICE is a valid service enumeration value
    service my_service;

    // Get the singleton instance of the system_manager_service
    std::shared_ptr<system_manager_service> manager = system_manager_service::getInstance(my_service);

    // Run the service
    std::cout << "Starting system manager service..." << std::endl;
    manager->run();
    std::cout << "System manager service stopped." << std::endl;

    return 0;
}
