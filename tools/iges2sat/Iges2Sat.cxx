/* 
   This code may be freely distributed as long as it contains the
	following copyright notices.

   Copyright (C) 2001 Daniel Lapadat (DanL@drexel.edu)

   Created by Daniel Lapadat (DanL@drexel.edu)
   Created 6/28/2001
   Modifications: none

   Iges2Sat.cxx converts iges (*.igs or *.iges) files to SAT files
   Copyright (C) 2001 Daniel Lapadat (DanL@drexel.edu)

   This program is free software; you can redistribute it and/or
   modify it under the terms of the GNU General Public License
   as published by the Free Software Foundation; either version 2
   of the License, or any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
*/

#include <stdio.h>
#include <string.h>

#include "kernel/acis.hxx"
#include "kernel/kernapi/api/api.hxx"
#include "kernel/kernapi/api/kernapi.hxx"
#include "kernel/kerndata/lists/lists.hxx" 
#include "baseutil/logical.h"
#include "kernel/kerndata/data/entity.hxx"
#include "kernel/kerndata/top/body.hxx"
#include "igeshusk/igs_api/routines.hxx"
#include "igeshusk/igs_api/iges_opt.hxx" 
#include "kernel/kerndata/savres/fileinfo.hxx"
#include "kernel/kernutil/version/version.hxx"

int main( int argc,  char** argv ) {
  char output[1024];
  FILE* fout = NULL;
  FILE* fin = NULL;
  FILE* igesdb = NULL;
  FILE* logfile = NULL;
  ENTITY_LIST EntList;
  outcome rc;

  if( argc != 3 ) {
    printf( "Usage: Iges2Sat input.igs output.sat\n" );
    return( 1 );
  }

  rc = api_start_modeller( 0 );
  if(!rc.ok()) {
    printf( "Could not start modeller\n" );
    printf( "%s", find_err_mess( rc.error_number() ) );
  }
  
  igesdb = fopen( "/gicl/projs4/ACIS-6.3/iges/igac/iges_04.dbt", "rb" );

  rc = api_initialize_iges( igesdb );
  if( !rc.ok() ) {
    printf( "Could not initialize iges library\n" );
    printf( "%s\n", find_err_mess( rc.error_number() ) );
    return( 1 );
  }

  printf( "Opening Iges Model...\n" );

  strcpy( output, argv[2] );
  fin = fopen( argv[1], "r" );
  strcat( argv[2], ".igs.log" );
  logfile = fopen( argv[2], "w" );

  int tmp; //not used
  rc = api_iges_read( fin, logfile, 0, EntList, tmp );
  if( !rc.ok() ) {
    printf( "Could not get ACIS Entities from IGES file\n" );
    printf( "%s\n", find_err_mess( rc.error_number() ) );
    return( 1 );
  }

  fclose( fin );
  fclose( logfile );
  fclose( igesdb );

  printf( "Healing action...\n" );
  
  rc = api_iges_heal( EntList );
  if( !rc.ok() ) {
    printf( "Warning: Could not heal!!!\n" );
    printf( "%s\n", find_err_mess( rc.error_number() ) );
  }

  printf( "Saving SAT file...\n" );

  //figure out the conversion of iges units to acis units
  int units = iges_get_units_id();
  double acisUnits = 0.0;
  switch( units ) {
  case 1:
    acisUnits = 25.4;//Inches
    break;
  case 2:
    acisUnits = 1.0;//Millimeters
    break;
  case 4:
    acisUnits = 304.8;//Feet
    break;
  case 5:
    acisUnits = 1609344.0;//Miles
    break;
  case 6:
    acisUnits = 1000.0;//Meters
    break;
  case 7:
    acisUnits = 1000000.0;//Kilometers
    break;
  case 10:
    acisUnits = 10.0;//Centimeters
    break;
  default:
    acisUnits = -1.0;//Unspecified - Unknown - No equivlent values in ACIS
    break;
  }

  //set the file info
  FileInfo info;
  char id_string[128];
  
  sprintf( id_string, "ACIS IGES Translator - GICL, Daniel Lapadat - %d %d", get_major_version(), get_minor_version() );
  
  info.set_product_id( id_string );
  info.set_units( acisUnits );
  api_set_file_info( (FileId), info);
  api_set_file_info( (FileUnits), info);

  //save the sat file
  fout = fopen( output, "w" );
  rc = api_save_entity_list( fout, TRUE, EntList );
  if( !rc.ok() ) {
    printf( "Error: Could not save SAT file!\n" );
    printf( "%s\n", find_err_mess( rc.error_number() ) );
  }

  fclose( fout );
  
  EntList.init();
  BODY* TheBody;
  while( TheBody = (BODY*)EntList.next() )
    api_del_entity( TheBody );
  
  api_terminate_iges();
  api_stop_modeller();
  
  return( 0 );
}
