/*
#-------------------------------------------------------------------------------
# Copyright (c) 2014 Martin Marinov.
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the GNU Public License v3.0
# which accompanies this distribution, and is available at
# http://www.gnu.org/licenses/gpl.html
#
# Contributors:
#     Martin Marinov - initial API and implementation
#-------------------------------------------------------------------------------
*/

#ifndef EXTBUFFER_H_
#define EXTBUFFER_H_

typedef struct extbuffer {

	float * buffer;
	int size_valid_elements;

	int buffer_max_size;

	int offset;
	volatile int valid;
	volatile int cleartozero;

} extbuffer_t;

void extbuffer_init(extbuffer_t * container);
void extbuffer_preparetohandle(extbuffer_t * container, int size);
void extbuffer_cleartozero(extbuffer_t * container);
void extbuffer_dumptofile(extbuffer_t * container, char * filename, char * xname, char * yname);
void extbuffer_free(extbuffer_t * container);


#endif /* EXTBUFFER_H_ */