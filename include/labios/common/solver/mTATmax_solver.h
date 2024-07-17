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
/*******************************************************************************
 * Created by hariharan on 5/19/18.
 * Updated by akougkas on 6/30/2018
 ******************************************************************************/
#ifndef LABIOS_MAIN_MTATMAX_SOLVER_H
#define LABIOS_MAIN_MTATMAX_SOLVER_H
/******************************************************************************
 *include files
 ******************************************************************************/
#include <labios/common/data_structures.h>
#include <labios/common/solver/solver.h>
/******************************************************************************
 *Class
 ******************************************************************************/
class mTATmax_solver : public solver {
private:
  /******************************************************************************
   *Variables and members
   ******************************************************************************/
//  static std::shared_ptr<mTATmax_solver> instance;
  /******************************************************************************
   * For calculating mTAT
   ******************************************************************************/
  double mTAT(double mean_duration, double mean_speed, int n_tasks);

public:
  /******************************************************************************
   *Constructor
   ******************************************************************************/
  explicit mTATmax_solver(service service) : solver(service) {}
  /******************************************************************************
   *Interface
   ******************************************************************************/
  /*inline static std::shared_ptr<mTATmax_solver>
  getInstance(service service) {
    return instance == nullptr ? instance = std::shared_ptr<mTATmax_solver>(
                                     new mTATmax_solver(service))
                               : instance;
  }*/
  solver_output solve(solver_input input) override;

//  virtual ~mTATmax_solver() {}
};

#endif // LABIOS_MAIN_MTATMAX_SOLVER_H
