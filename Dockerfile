# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Install Node.js for build process
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get update \
    && apt-get -y install nodejs \
    && rm -rf /var/lib/apt/lists/*

# Copy and restore dependencies
COPY . ./
RUN dotnet restore

# Build and publish the application
RUN dotnet build "ShuttleInfraAPI.csproj" -c Release \
    && dotnet publish "ShuttleInfraAPI.csproj" -c Release -o publish

# Stage 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app

# Copy published application from build stage
COPY --from=build /app/publish .

# Set environment variables
ENV ASPNETCORE_URLS=http://*:5000

# Expose port
EXPOSE 5000

# Entrypoint
ENTRYPOINT ["dotnet", "ShuttleInfraAPI.dll"]
