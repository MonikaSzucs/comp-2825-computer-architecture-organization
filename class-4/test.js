const RPM = 3000
const RPS = RPM/60
const timeToOneRotation = (1/RPS) * 1000 // step 0
const worstTimeToTrack0 = 30
const bestTimeToTrack0 = 0
const timeToSector = 0 // or timeToOneRotation/2 
const timeToSwitchTracks = 2
const timeToSwitchPlatters = 1
const numberOfTracks = 6
const numberOfCylinders = 400

function calculateTimeToReadDisc(){
    let totalTimeToReadDisc = 0
    const timeToTrack0 = (bestTimeToTrack0 + worstTimeToTrack0)/2; // step 1
    console.log(totalTimeToReadDisc)
    totalTimeToReadDisc += timeToSector ? timeToSector + timeToOneRotation : timeToOneRotation; // step 2
    console.log(totalTimeToReadDisc)
    if (timeToSwitchPlatters) totalTimeToReadDisc += timeToSwitchPlatters // step 3
    console.log(totalTimeToReadDisc);
    totalTimeToReadDisc = totalTimeToReadDisc * numberOfTracks;
    console.log(totalTimeToReadDisc)
    if (timeToSwitchTracks) totalTimeToReadDisc += timeToSwitchTracks;
    console.log(totalTimeToReadDisc)
    totalTimeToReadDisc = totalTimeToReadDisc * numberOfCylinders;
    return totalTimeToReadDisc + timeToTrack0
}

console.log(calculateTimeToReadDisc())