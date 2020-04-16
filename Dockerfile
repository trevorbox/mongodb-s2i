FROM registry.access.redhat.com/rhscl/mongodb-36-rhel7
LABEL "io.k8s.display-name"="ssl-mongodb-36-rhel7" \
      "io.openshift.s2i.build.image"="registry.access.redhat.com/rhscl/mongodb-36-rhel7" \
      "io.openshift.s2i.build.source-location"="extending-image/"

USER root
# Copying in source code
COPY upload/src /tmp/src
# Change file ownership to the assemble user. Builder image must support chown command.
RUN chown -R 1001:0 /tmp/src
# Assemble script sourced from builder image based on user input or image metadata.
# If this file does not exist in the image, the build will fail.
RUN /usr/libexec/s2i/assemble

USER 1001
# Run script sourced from builder image based on user input or image metadata.
# If this file does not exist in the image, the build will fail.
CMD /usr/libexec/s2i/run
