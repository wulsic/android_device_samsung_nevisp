/*
   Copyright (c) 2013, The Linux Foundation. All rights reserved.

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <stdlib.h>
#include <stdio.h>

#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
#include "util.h"

void vendor_load_properties() {
	FILE* file;
	char* simslot_count_path = "/proc/simslot_count";
	// Create a two byte array, so we can use it as a string
	char simslot_count[2] = "\0";

	// Open the file as read-only
	file = fopen(simslot_count_path, "r");

	// Check if it opened correctly
	if (file != NULL) {
		simslot_count[0] = fgetc(file);
		property_set("ro.multisim.simslotcount", simslot_count);

		if(!strcmp(simslot_count, "0") || !strcmp(simslot_count, "1")) {
			// Treat the device as a single-SIM phone, when there is 1 or none SIM cards inserted
			property_set("persist.dsds.enabled", "false");
			property_set("persist.radio.multisim.config", "none");
			property_set("ro.product.model", "S-S6810P");
		} else {
			// Treat the device as a dual-SIM phone, when there is 2 SIM cards inserted
			property_set("persist.dsds.enabled", "true");
			property_set("persist.radio.multisim.config", "dsds");
			property_set("ro.product.model", "S-S6812");
		}
		// Close the file after using it
		fclose(file);
	} else {
		// Print an error message to the log, if the file was not opened correctly
		ERROR("Could not open '%s'\n", simslot_count_path);
	}
}
