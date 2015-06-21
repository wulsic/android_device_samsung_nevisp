/*
 * Copyright (C) 2014 The Android Open Source Project
 * Copyright (C) 2014 The Omnirom Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "RheaAudioPolicyManager"
//#define LOG_NDEBUG 0

#include "RheaAudioPolicyManager.h"

namespace android {

extern "C" AudioPolicyInterface* createAudioPolicyManager(AudioPolicyClientInterface *clientInterface)
{
    return new RheaAudioPolicyManager(clientInterface);
}

extern "C" void destroyAudioPolicyManager(AudioPolicyInterface *interface)
{
    delete interface;
}

RheaAudioPolicyManager::RheaAudioPolicyManager(AudioPolicyClientInterface *clientInterface)
    : AudioPolicyManager(clientInterface)
{
}

void RheaAudioPolicyManager::setPhoneState(audio_mode_t state)
{
    if (!isStateInCall(mPhoneState) && isStateInCall(state)) {
		// On Nevisp, we need to reset mLastVoiceVolume every call start to force the
		// volume to be always set since the HAL sometimes forget about it
        ALOGI("Resetting mLastVoiceVolume");
        mLastVoiceVolume = -1.0f;
    }

	// Call parent function
	AudioPolicyManager::setPhoneState(state);
}

}; // namespace android
