Fem1
$ VERSION: TMG         5.0.0
$ DATE:   97/ 3/18
$ TIME:   13:31:10
$ FILE:   plate_with_forced
$ NAME:   Fem1
$ LABEL                 0          0
$ PROP LIMIT            0          0
$ ELEM RANGE            1         12         12
$ NODE RANGE            1         24         20
$ PART ORIGIN   0.0000000E+00  0.0000000E+00  0.0000000E+00
$ PART X_AXIS   1.0000000E+00  0.0000000E+00  0.0000000E+00
$ PART Y_AXIS   0.0000000E+00  1.0000000E+00  0.0000000E+00
$ PART Z_AXIS   0.0000000E+00  0.0000000E+00  1.0000000E+00
$ UNITS  5   1.0000000E+03  1.0000000E+03  1.0000000E+00 -2.7315000E+02
-1
M      7
N    512
IST      0
IA      0
TLIN  8.151988E+07
SIGMA  5.669600E-08
PSUN  1.353000E+03
PIR  2.360000E+02
MESH 2
KSP       0
RK  0.000000E+00
$    STEADY STATE ANALYSIS
 1.000000E-03  -273.150000      0  5.000000E-01  0.000000E+00      10000
-1
-1
     1  9.154847E+00 -5.111865E+01  0.000000E+00
     2  9.154847E+00 -5.111865E+01  1.666667E+02
     3  9.154847E+00 -5.111865E+01  3.333333E+02
     4  9.154847E+00 -5.111865E+01  5.000000E+02
     5  7.959112E+01 -5.111865E+01  0.000000E+00
     6  7.959112E+01 -5.111865E+01  1.666667E+02
     7  7.959112E+01 -5.111865E+01  3.333333E+02
     8  7.959112E+01 -5.111865E+01  5.000000E+02
    13 -6.128143E+01 -5.111865E+01  5.000000E+02
    14 -6.128143E+01 -5.111865E+01  3.333333E+02
    15 -6.128143E+01 -5.111865E+01  1.666667E+02
    16 -6.128143E+01 -5.111865E+01  0.000000E+00
    17  9.154847E+00 -2.168247E+00  4.996212E+02
    18  9.154847E+00 -2.168247E+00  3.339657E+02
    19  9.154847E+00 -2.168247E+00  1.651268E+02
    20  9.154847E+00 -2.168247E+00  8.353025E-01
    21  9.154847E+00 -2.168247E+00  5.096211E+02
    22  7.959112E+01  4.678216E+01  5.000000E+02
    23 -6.012552E+01  4.678216E+01  5.000000E+02
    24  9.154847E+00 -2.168247E+00  5.596211E+02
    25  0.000000E+00  0.000000E+00 -1.000000E+06
-1
$    Elements
     1 SURFACE M0001  0.0 P0001      1      2      6      5
     2 SURFACE M0001  0.0 P0001      2      3      7      6
     3 SURFACE M0001  0.0 P0001      3      4      8      7
     4 SURFACE M0001  0.0 P0001      4      3     14     13
     5 SURFACE M0001  0.0 P0001      3      2     15     14
     6 SURFACE M0001  0.0 P0001      2      1     16     15
$     AMBIENT       1
    13 AMBIENT M0002 0 0     25
     7 DUCT M0002  0.0 P0003     17     18
     8 DUCT M0002  0.0 P0003     18     19
     9 DUCT M0002  0.0 P0003     19     20
    10 FANPUMP  0.0  0.0 P0002     21     17
    11 BLSTART M0002  0.0 P0004     21
    12 DUCT M0002  0.0 P0003     24     21
-1
$     RADIATION PARAMETERS       1
VFMIN  0.000000E+00
MESH 2
$     NEARC1       1
AREA PLATES      0      0 DUCTS      0 1.0000000E+00 NEARC1
-1
-1
-1
VERSION      7.000
$    Physical Properties for Shell Elements
PROP      1 SHELL  1.000000E+00
$    Materials
$ GENERIC_ISOTROPIC_STEEL
MAT      1 7.820000E-06  0.00000E+00   1.000000      1.00000  4.50000E+04
MAT2      1 0.0 SOLID 1000000  0.00000E+00  0.00000E+00  1.17000E-05
$ TMG_AIR
MAT      2 1.207000E-09  1.00700E+09 -2.34 -2.34  2.63000E+01
MAT2      2  1.85000E-08 GAS 1000000 0 0  0.00000E+00
$     AMBIENT CONDITION       1
HYDENV  1.013510E+02  1.999999E+01  9.810000E+03     .0000000     .0000000
NAME AMBIENT     13
XCAP     13 0  0.000000E+00
NAME ZNG0001     13
SINK AMBIENT  2.499999E+01 CONSTANT
PARAM QOPPCAL
$     ANALYSIS_OPTIONS       1
PARAM ILU
PARAM COND NEW
$     VARI_CONTROL       1
VARIABLE %TMGVAR0  0.000000E+00
VARIABLE %TMGVAR1  0.000000E+00
VARIABLE %TMGVAR2  0.000000E+00
VARIABLE %TMGVAR3  0.000000E+00
VARIABLE %TMGVAR4  0.000000E+00
VARIABLE %TMGVAR5  0.000000E+00
VARIABLE %TMGVAR6  0.000000E+00
VARIABLE %TMGVAR7  0.000000E+00
$     RESULTS RECOVERY       1
PRINT 0 0 NDTEMP
PRINT 0 0 ELTEMP
NAME ZEL0001      1      6      1
$     HEAT LOAD       1
QNODE ZEL0001  1.000000E+06 CONSTANT TOTAL
NAME PLATES      1      6      1
NAME DUCTS      7      9      1
NAME ZEL0004     10     10      0
$     PUMP       1
PROP      2 FANPUMP 1.0      1
TABTYPE      1 VOLUME TIME
TABDATA      1  1.000000E+04 0.0
PROP      3 DUCT 1.0
PROP      4 BLSTART  1.373496E+04  1.153235E+02
-1
      SUBROUTINE USER1(GG,T,C,Q,QD,R,TIME,DT,IT,KODE,NOCON,MAXNO,ICONV,
     +DUM1,DUM2,DTP,TF)
      DIMENSION GG(*),QD(*),T(*),C(*),Q(*),R(*),ICONV(*)
      DIMENSION ICOND1(4,10000),PROP(10,10000)
      SAVE
      DATA KINIT/0/
C
C  This sub changes the convective couplings from
C  elements in group 'PLATES' to hydraulic elements
C  in group 'DUCTS'. It uses the correlation
C  H = 3.66 * Aircond/Hydraulic diameter
C
C  This loop is done only once at the beginning
C  of the analyzer run.
C
      IF(KINIT.EQ.0)THEN
      KINIT=1
C
C  Read all conductances between plate and air
C  You must create an array large enough to contain all
C  conductances  ICOND(4,10000)
C
      CALL TCNAME('PLATES','DUCTS',ICOND1(1,1),NC1)
      NTOT=NC1
C
C  read all element properties in array PROP
C
      CALL READPROP2(PROP,GEOM,NDGRID,GRID,'Y','N','N','N')
C
      END IF 
C
C  With Kode = 1, you enter the analyzer just before it will
C  calculate temperatures. You modify your conductances at
C  that point. 
C
      IF(KODE.EQ.1)THEN
        DO 25 I=1,NTOT
          KN=ICOND1(1,I)
          N1=ICOND1(2,I)
          N2=ICOND1(3,I)
          TN2=T(N2)
          DIAM=HYDPROP(7,N2)
          AIRK=HYDPROP(12,N2)
          HNEW=3.66*AIRK/Diam
          GG(KN)=R(kn)/Hnew
25      CONTINUE
      END IF
      RETURN
      END
-1
