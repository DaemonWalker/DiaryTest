#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:5.0 as base
MAINTAINER Daemon Walker
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:5.0 as build
WORKDIR /src
COPY ["DiaryTest/DiaryTest.csproj", "DiaryTest/"]
RUN dotnet restore "DiaryTest/DiaryTest.csproj"
COPY . .
WORKDIR "/src/DiaryTest"
RUN dotnet build "DiaryTest.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "DiaryTest.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "DiaryTest.dll"]