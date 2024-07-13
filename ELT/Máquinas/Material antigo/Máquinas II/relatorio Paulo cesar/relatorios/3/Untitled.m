clear all; close all; clc;

%%
%%  cubic.m
%%
%%  M-file  to  compute  a  cubic  polynomial  reference  trajectory
%%
%%  q0    =  initial  position
%%  v0    =  initial  velocity
%%  q1    =  final  position
%%  v1    =  final  velocity
%%  t0    =  initial  time
%%  tf    =  final  time
%%
clear
d    =  input('initial  data  =  [q0,v0,q1,v1,t0,tf]  = ');
q0  =  d(1);  v0  =  d(2);  q1  =  d(3);  v1  =  d(4);
t0  =  d(5);  tf  =  d(6);
t  =  linspace(t0,tf,100*(tf-t0));
c  =  ones(size(t));
M  =  [  1  t0  t0^2  t0^3;
0  1  2*t0  3*t0^2;
1  tf  tf^2  tf^3;
0  1  2*tf  3*tf^2];
%%
b  =  [q0;  v0;  q1;  v1];
a  =  inv(M)*b;
%%
%  qd  =  reference  position  trajectory
%  vd  =  reference  velocity  trajectory
%  ad  =  reference  acceleration  trajectory
%
qd  =  a(1).*c  +  a(2).*t  +a(3).*t.^2  +  a(4).*t.^3;
vd  =  a(2).*c  +2*a(3).*t  +3*a(4).*t.^2;
ad  =  2*a(3).*c  +  6*a(4).*t;