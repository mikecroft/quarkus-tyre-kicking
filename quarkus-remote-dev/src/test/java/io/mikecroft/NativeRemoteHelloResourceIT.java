package io.mikecroft;

import io.quarkus.test.junit.NativeImageTest;

@NativeImageTest
public class NativeRemoteHelloResourceIT extends RemoteHelloResourceTest {

    // Execute the same tests but in native mode.
}