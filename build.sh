#!/bin/sh
# Copyright(c) 2013 Red Hat Middleware, LLC,
# and individual contributors as indicated by the @authors tag.
# See the copyright.txt in the distribution for a
# full listing of individual contributors.
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library in the file COPYING.LIB;
# if not, write to the Free Software Foundation, Inc.,
# 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA
#
# @author Jean-Frederic Clere
#
echo ""
echo "Running `basename $0` $LastChangedDate: 2011-05-06 16:35:58 +0200 (Fri, 06 May 2011) $"
echo ""
echo "Started : `date`"
echo "Params  : $@"
echo ""

# Globals
build_top=`pwd`
export build_top
force_64=false

while [ "x" != "x$1" ]
do
  case  $1 in
    64)
      force_64=true
      ;;
    32)
      force_64=false
      ;;
    *)
      echo "Parameter $1 not supported"
      echo "Usage build.sh [-64]"
      exit 1
      ;;
  esac
  shift
done

if $force_64; then
  mvn -Djvmsize=64 -Dhostname=localhost -Dbuild_top=$build_top install || exit 1
else
  mvn -Djvmsize=32 -Dhostname=localhost -Dbuild_top=$build_top install || exit 1
fi

echo ""
echo "SUCCESS : `basename $0` $LastChangedDate: 2011-05-06 16:35:58 +0200 (Fri, 06 May 2011) $"
echo ""
